	
local function ramisyria(msg, matches)
local data = load_data(_config.moderation.data)
----------------kick by replay ----------------
if matches[1] == 'طرد' and is_mod(msg) then
   if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنك طردي هكذا 🙁"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن طرد الادمنيه والمطورين 😛"
    else
	kick_user(msg.reply.id, msg.to.id) 
 end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "المستخدم👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "لا يمكنك طردي هكذا 🙁"
    end
if is_mod1(msg.to.id, User.id) then
   return "لا يمكن طرد الادمنيه والمطورين 😛"
     else
	kick_user(User.id, msg.to.id) 
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "لا يمكنك طردي هكذا 🙁"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "لا يمكن طرد الادمنيه والمطورين 😛"
   else
     kick_user(tonumber(matches[2]), msg.to.id) 
        end
     end
   end 

---------------Ban-------------------      
                   
if matches[1] == 'حظر' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if is_banned(msg.reply.id, msg.to.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." بالفعل محظور ‼️😄"
    else
ban_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id)
     kick_user(msg.reply.id, msg.to.id) 
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." تم حظره 😨🚫"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
if is_mod1(msg.to.id, User.id) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if is_banned(User.id, msg.to.id) then
    return "العضو👤 "..check_markdown(User.username).." "..User.id.." بالفعل محظور ‼️😄"
    else
   ban_user(check_markdown(User.username), User.id, msg.to.id)
     kick_user(User.id, msg.to.id) 
    return "العضو👤 "..check_markdown(User.username).." "..User.id.." تم حضره 😨🚫"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if is_banned(tonumber(matches[2]), msg.to.id) then
    return "العضو👤 "..matches[2].." بالفعل محظور ‼️😄"
    else
   ban_user('', matches[2], msg.to.id)
     kick_user(tonumber(matches[2]), msg.to.id)
    return "العضو👤 "..matches[2].." تم حظره 😨🚫"
        end
     end
   end

---------------Unban-------------------                         

if matches[1] == 'الغاء حظر' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if not is_banned(msg.reply.id, msg.to.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." ليس محظور سابقا ‼️😄"
    else
unban_user(msg.reply.id, msg.to.id)
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." تم رفع الحظر عنه ‼️😄"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_banned(User.id, msg.to.id) then
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.." ليس محظور سابقا 🚫🌝"
    else
   unban_user(User.id, msg.to.id)
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.." تم رفع الحظر عنه ‼️😄"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_banned(tonumber(matches[2]), msg.to.id) then
    return "العضو👤 "..matches[2].." ليس محظور سابقا 🚫🌝"
    else
   unban_user(matches[2], msg.to.id)
    return "العضو👤 "..matches[2].." تم رفع الحظر عنه ‼️😄"
        end
     end
   end

------------------------Silent-------------------------------------

if matches[1] == 'كتم' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن كتم الادمنيه والمطورين 😛‼️"
    end
  if is_silent_user(msg.reply.id, msg.to.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." مكتوم بالفعل 🔕😶"
    else
silent_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id)
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." تم تم كتمه 🔕😶"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, User.id) then
   return "لا يمكن كتم الادمنيه والمطورين 😛‼️"
    end
  if is_silent_user(User.id, msg.to.id) then
    return "المستخدم👤 @"..check_markdown(User.username).." "..User.id.." مكتوم بالفعل 🔕😶"
    else
   silent_user("@"..check_markdown(User.username), User.id, msg.to.id)
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.." تم تم كتمه 🔕😶"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "لا يمكن كتم الادمنيه والمطورين 😛‼️"
    end
  if is_silent_user(tonumber(matches[2]), msg.to.id) then
    return "العضو👤 "..matches[2].." مكتوم بالفعل 🔕😶"
    else
   ban_user('', matches[2], msg.to.id)
     kick_user(tonumber(matches[2]), msg.to.id)
    return "العضو👤 "..matches[2].." تم تم كتمه 🔕😶"
        end
     end
   end

------------------------Unsilent----------------------------
if matches[1] == 'الغاء الكتم' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if not is_silent_user(msg.reply.id, msg.to.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."ليس مكتوم 🌝🔇"
    else
unsilent_user(msg.reply.id, msg.to.id)
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تم رفع الكتم عنه 🙃🔕"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_silent_user(User.id, msg.to.id) then
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.."ليس مكتوم 🌝🔇"
    else
   unsilent_user(User.id, msg.to.id)
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.."تم رفع الكتم عنه 🙃🔕"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_silent_user(tonumber(matches[2]), msg.to.id) then
    return "العضو👤 "..matches[2].."ليس مكتوم 🌝🔇"
    else
   unsilent_user(matches[2], msg.to.id)
    return "العضو👤 "..matches[2].."تم رفع الكتم عنه 🙃🔕"
        end
     end
   end
-------------------------Banall-------------------------------------
                   
if matches[1] == 'عام' and is_admin(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
if is_admin1(msg.reply.id) then
   return "لا يمكن الحظر الا من قبل الادمن 😑‼️"
    end
  if is_gbanned(msg.reply.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." بالفعل محظور عام ‼️😨"
    else
banall_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id)
     kick_user(msg.reply.id, msg.to.id) 
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." تم حظره حظر عام 🚫🗣"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
if is_admin1(User.id) then
   return "لا يمكن الحظر الا من قبل الادمن 😑‼️"
    end
  if is_gbanned(User.id) then
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.." بالفعل محظور عام ‼️😨"
    else
   banall_user("@"..check_markdown(User.username), User.id)
     kick_user(User.id, msg.to.id) 
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.." تم حظره حظر عام 🚫🗣"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if is_admin1(tonumber(matches[2])) then
if tonumber(matches[2]) == tonumber(our_id) then
   return "لا يمكنني حظر نفسي 😆‼️"
    end
   return "لا يمكن الحظر الا من قبل الادمن 😑‼️"
    end
  if is_gbanned(tonumber(matches[2])) then
    return "العضو👤 "..matches[2].." بالفعل محظور عام ‼️😨"
    else
   banall_user('', matches[2])
     kick_user(tonumber(matches[2]), msg.to.id)
    return "العضو👤 "..matches[2].." تم حظره حظر عام 🚫🗣"
        end
     end
   end
--------------------------Unbanall-------------------------

if matches[1] == 'الغاء العام' and is_admin(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "لا يمكنني كتم نفسي 😑‼️"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "لا يمكن حظر الادمنيه والمطورين 😛"
    end
  if not is_gbanned(msg.reply.id) then
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.." بالفعل محظور عام ‼️😨"
    else
unbanall_user(msg.reply.id)
    return "العضو👤 "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تم حظره حظر عام 🚫🗣"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "العضو👤 غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_gbanned(User.id) then
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.."ليس محظور حظر عام 😛‼️"
    else
   unbanall_user(User.id)
    return "العضو👤 @"..check_markdown(User.username).." "..User.id.."تم حظره حظر عام 🚫🗣"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_gbanned(tonumber(matches[2])) then
    return "العضو👤 "..matches[2].."ليس محظور حظر عام 😛‼️"
    else
   unbanall_user(matches[2])
    return "العضو👤 "..matches[2].."تم حظره حظر عام 🚫🗣"
        end
     end
   end
   -----------------------------------LIST---------------------------
   if matches[1] == 'المحظورين' and is_mod(msg) then
   return banned_list(msg.to.id)
   end
   if matches[1] == 'المكتومين' and is_mod(msg) then
   return silent_users_list(msg.to.id)
   end
   if matches[1] == 'المحظورين عام' and is_admin(msg) then
   return gbanned_list(msg)
   end
   ---------------------------clean---------------------------
   if matches[1] == 'تنظيف' and is_mod(msg) then
	if matches[2] == 'المحظورين' then
		if next(data[tostring(msg.to.id)]['banned']) == nil then
			return "لا يوجد مستخدمين محظورين ابدا 😛‼️"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['banned']) do
			data[tostring(msg.to.id)]['banned'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "تم تنظيف قائمة المحظورين 🚫🌝"
	end
	if matches[2] == 'المكتومين' then
		if next(data[tostring(msg.to.id)]['is_silent_users']) == nil then
			return "لا يوجد مستخدمين مكتومين ابدا 🔕😶"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['is_silent_users']) do
			data[tostring(msg.to.id)]['is_silent_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "تم تنظيف قائمة المكتومين 🙃🔕"
	end
	if matches[2] == 'المحظورين عام' and is_admin(msg) then
		if next(data['gban_users']) == nil then
			return "لا يوجد مستخدمين محظورين عام 😑‼️"
		end
		for k,v in pairs(data['gban_users']) do
			data['gban_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "تم تنظيف قائمة المحظورين عام 🚫🌝"
	end
   end

end
return {
	patterns = {
"^(حظر) (.*)$",
"^(حظر)$",
"^(الغاء حظر) (.*)$",
"^(الغاء حظر)$",
"^(طرد) (.*)$",
"^(طرد)$",
"^(عام) (.*)$",
"^(عام)$",
"^(الغاء العام) (.*)$",
"^(الغاء العام)$",
"^(الغاء الكتم) (.*)$",
"^(الغاء الكتم)$",
"^(كتم) (.*)$",
"^(كتم)$",
"^(المكتومين)$",
"^(المحظورين)$",
"^(المحظورين عام)$",
"^(تنظيف) (.*)$",
	},
	run = ramisyria,

}
