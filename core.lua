-------------------------
---// Locale String //---
-------------------------

      local L = setmetatable({

            ['enUS'] = {
                  ['list']     = '%s |cFF00619E(%s)|r',
                  ['kill']     = '|cFF00619EDatabase has been killed.|r',
                  ['enable']   = '|cFF00619EReload to enable all addons.|r',
                  ['disable']  = '|cFF00619EReload to disable all addons.|r',
                  ['save']     = '|cFF00619EProfile |cFFFFFF61[%s]|cFF00619E has been saved.|r',
                  ['load']     = '|cFF00619EProfile |cFFFFFF61[%s]|cFF00619E has been loaded.|r',
                  ['delete']   = '|cFF00619EProfile |cFFFFFF61[%s]|cFF00619E has been deleted.|r',
                  ['noexists'] = '|cFF00619EProfile |cFFFFFF61[%s]|cFF00619E doesn\'t exist.|r',
                  ['help1']    = '/awp kill |cFF00619E-- Kill the database.|r',
                  ['help2']    = '/awp list |cFF00619E-- List the profiles.|r',
                  ['help3']    = '/awp load |cFFFFFF61profile |cFF00619E-- LOAD the profile.|r',
                  ['help4']    = '/awp save |cFFFFFF61profile |cFF00619E-- SAVE the profile.|r',
                  ['help5']    = '/awp delete |cFFFFFF61profile |cFF00619E-- DELETE the profile.|r',
                  ['help6']    = '/rl |cFF00619E-- Reload UI.|r'
            },

            ['zhTW'] = {
                  ['list']     = '%s |cFF00619E(%s)|r',
                  ['kill']     = '|cFF00619E已刪除所有資料。|r',
                  ['enable']   = '|cFF00619E重載介面以啓用所有插件。|r',
                  ['disable']  = '|cFF00619E重載介面以停用所有插件。|r',
                  ['save']     = '|cFF00619E設定檔|cFFFFFF61[%s]|cFF00619E已儲存。|r',
                  ['load']     = '|cFF00619E設定檔|cFFFFFF61[%s]|cFF00619E已讀取。|r',
                  ['delete']   = '|cFF00619E設定檔|cFFFFFF61[%s]|cFF00619E已刪除。|r',
                  ['noexists'] = '|cFF00619E設定檔|cFFFFFF61[%s]|cFF00619E不存在。|r',
                  ['help1']    = '/awp kill |cFF00619E-- 刪除所有資料。|r',
                  ['help2']    = '/awp list |cFF00619E-- 列出設定檔。|r',
                  ['help3']    = '/awp load |cFFFFFF61profile |cFF00619E-- 讀取|cFFFFFF61[profile]|cFF00619E設定。|r',
                  ['help4']    = '/awp save |cFFFFFF61profile |cFF00619E-- 儲存|cFFFFFF61[profile]|cFF00619E設定。|r',
                  ['help5']    = '/awp delete |cFFFFFF61profile |cFF00619E-- 刪除|cFFFFFF61[profile]|cFF00619E設定。|r',
                  ['help6']    = '/rl |cFF00619E-- 重載介面。|r'
            },

            ['zhCN'] = {
                  ['list']     = '％s |cFF00619E(％)|r',
                  ['kill']     = '|cFF00619E已删除所有资料。|r',
                  ['enable']   = '|cFF00619E重载介面以启用所有插件。|r',
                  ['disable']  = '|cFF00619E重载介面以停用所有插件。|r',
                  ['save']     = '|cFF00619E设定档|cFFFFFF61[％s]|cFF00619E已储存。|r',
                  ['load']     = '|cFF00619E设定档|cFFFFFF61[％s]|cFF00619E已读取。|r',
                  ['delete']   = '|cFF00619E设定档|cFFFFFF61[％s]|cFF00619E已删除。|r',
                  ['noexists'] = '|cFF00619E设定档|cFFFFFF61[％s]|cFF00619E不存在。|r',
                  ['help1']    = '/awp kill |cFF00619E-- 删除所有资料。|r',
                  ['help2']    = '/awp list |cFF00619E-- 列出设定档。|r',
                  ['help3']    = '/awp load |cFFFFFF61profile |cFF00619E-- 读取|cFFFFFF61[profile]|cFF00619E设定。|r',
                  ['help4']    = '/awp save |cFFFFFF61profile |cFF00619E-- 储存|cFFFFFF61[profile]|cFF00619E设定。|r',
                  ['help5']    = '/awp delete |cFFFFFF61profile |cFF00619E-- 删除|cFFFFFF61[profile]|cFF00619E设定。|r',
                  ['help6']    = '/rl |cFF00619E-- 重载介面。|r'
            }

      }, {__index = function(self) return self['enUS'] end})


----------------------
---// Main Frame //---
----------------------

      tinsert(UISpecialFrames, '!AWP')

      local AWP = CreateFrame('Frame', '!AWP')
            AWP:SetFrameStrata('DIALOG')
            AWP:SetFrameLevel(15)
            AWP:SetScale(max(768/tonumber(strmatch(GetCVar('gxResolution'), '%d+x(%d+)')), .64))
            AWP:SetSize(340, 210)
            AWP:SetMinResize(340, 210)
            AWP:SetMaxResize(1920, 1200)
            AWP:SetPoint('TOP', 0, -210)
            AWP:SetBackdrop({
                  bgFile = 'Interface/Buttons/WHITE8x8',
                  insets = {left = 0, right = 0, top = 0, bottom = 0}
            })
            AWP:SetBackdropColor(0, 0, 0, .382)
            AWP:SetMovable(1)
            AWP:EnableMouse(1)
            AWP:SetResizable(1)
            AWP:SetUserPlaced(1)
            AWP:SetClampedToScreen(1)
            AWP:SetScript('OnMouseDown', AWP.StartMoving)
            AWP:SetScript('OnMouseUp', AWP.StopMovingOrSizing)
            AWP:Hide()

      local T = AWP:CreateFontString(nil, 'OVERLAY', 'SystemFont_Med2')
            T:SetText('|cFFDDDDDDA|cFF9E9E9Eddon |cFFDDDDDDW|cFF9E9E9Eork |cFFDDDDDDP|cFF9E9E9Eermission|r')
            T:SetPoint('TOP', 0, -6)

      local G = CreateFrame('Button', nil, AWP)
            G:SetSize(9.5, 9.5)
            G:SetPoint('BOTTOMRIGHT', 1, -1)
            G:SetNormalTexture('Interface/CHATFRAME/UI-ChatIM-SizeGrabber-Up')
            G:SetPushedTexture('Interface/CHATFRAME/UI-ChatIM-SizeGrabber-Down')
            G:SetHighlightTexture('Interface/CHATFRAME/UI-ChatIM-SizeGrabber-Highlight')
            G:SetScript('OnMouseDown', function() AWP:StartSizing() end)
            G:SetScript('OnMouseUp', function() AWP:StopMovingOrSizing() end)


-------------------------
----/ Scroll Frame /-----
-------------------------

      local S, C = CreateFrame('ScrollFrame', '!AWP ScrollFrame', AWP, 'MinimalScrollFrameTemplate'), CreateFrame('Frame', nil, S)
            S:SetScrollChild(C)
            S:SetPoint('TOPLEFT', 4, -27)
            S:SetPoint('BOTTOMRIGHT', -24, 28)
            S:SetBackdrop({
                  bgFile = 'Interface/Buttons/WHITE8x8',
                  insets = {left = 0, right = 0, top = -4, bottom = -5}
            })
            S:SetBackdropColor(0, 0, 0, .382)

            local sb = _G['!AWP ScrollFrameScrollBar']
                  sb:ClearAllPoints()
                  sb:SetPoint('RIGHT', AWP, -4, 0)
                  sb:SetPoint('TOPLEFT', S, 'TOPRIGHT', 4, 4)
                  sb:SetPoint('BOTTOMLEFT', S, 'BOTTOMRIGHT', 4, -5)
                  sb.trackBG:SetTexture()
                  local ub, db = sb:GetChildren()
                        ub:SetSize(0, 0)
                        db:SetSize(0, 0)
                  local _, tb = sb:GetRegions()
                        tb:SetTexture('Interface/Buttons/WHITE8x8')
                        tb:SetVertexColor(0, 0, 0, .382)
                        tb:SetSize(16, .001)

            S:HookScript('OnSizeChanged', function(self, w, h)
                  C:SetSize(w, h)
            end)

            S:HookScript('OnMouseWheel', function(self, delta)
                  if not IsShiftKeyDown() then
                        return
                  end
                  self:SetVerticalScroll(delta>0 and 0 or self:GetVerticalScrollRange())
            end)

            S:HookScript('OnScrollRangeChanged', function(self, _, y)
                  if y < 1 then
                        tb:SetHeight(.001)
                        return
                  end
                  local h = self:GetHeight()
                  tb:SetHeight(h^2/(h+y))
                  sb:SetMinMaxValues(0, y)
            end)


-------------------
----/ Utility /----
-------------------

      local GetAddOnInfo, IsAddOnLoaded, IsAddOnLoadOnDemand, Tip
          = GetAddOnInfo, IsAddOnLoaded, IsAddOnLoadOnDemand, GameTooltip
      local N = GetNumAddOns()
            L = L[GetLocale()]
      local temporary = setmetatable({}, {
            __newindex = function(self, key) tinsert(self, key) end,
            __tostring = function(self) return table.concat(self, ', ') end
      })


--------------------
---// Function //---
--------------------

      local function SysMsg(msg, ...)
            print('|cFF00619E[!AWP]:|r', L[msg]:format(...))
      end

      local function CheckState(i)
            local cb = C[i]
            local loaded = IsAddOnLoaded(i)
            local lod = IsAddOnLoadOnDemand(i)
            local addon, title, _, enable, _, reason = GetAddOnInfo(i)
            local r, g, b = .382, .382, .382
            local r1, b1, g1 = .618, 0, 0
            local arrow = '|TInterface/RAIDFRAME/UI-RAIDFRAME-ARROW:12:12:0:0:32:32:10:26:8:24|t ' --11:25  8:24 15x17
            if not enable then
                  arrow = loaded and arrow
            elseif reason then
                  r, g, b = .618, 0, 0
                  arrow = nil
            else
                  r, g, b = 1, .786, 0
                  r1, b1, g1 = .618, .618, .618
                  arrow = not(loaded or lod) and arrow            
            end
            local lock = AWPDB.LOCKED[addon]
            if lock then
                  lock = '|TInterface/LFGFRAME/UI-LFG-ICON-LOCK:12:12:1:0:32:32:1:27:1:27|t ' --1:22 1:27  22x27
                  cb:RegisterForClicks('RightButtonDown')
            end
            cb:SetChecked(enable)
            cb:GetCheckedTexture():SetVertexColor(r1, b1, g1)
            cb:SetNormalTexture(enable and '' or 'Interface/Buttons/WHITE8x8')
            cb.text:SetTextColor(r, g, b)
            cb.text:SetFormattedText('%s%s%s', lock or '', arrow or '', title)
      end

      local function CheckAllState()
            for i = 1, N do
                  CheckState(i)
            end
      end

      local function Switch(i, state)
            local force = IsShiftKeyDown()
            state = force or state
            if not state then
                  DisableAddOn(i)
                  return
            else
                  EnableAddOn(i)
                  if force then
                        LoadAddOn(i)
                        return
                  end
            end
      end

      local function SwitchAll(state, silence)
            for i = 1, N do
                  if not AWPDB.LOCKED[GetAddOnInfo(i)] then
                        Switch(i, state)
                  end
            end
            PlaySound('igMainMenuOptionCheckBoxOn')
            CheckAllState()
            if silence then
                  return
            end
            SysMsg(state and 'enable' or 'disable')
      end

      local function MemoryUsage(i)
            local mem = GetAddOnMemoryUsage(i)
            if mem > 999 then
                  return '9E9E00', mem/1024, 'M'
            else
                  return '009E00', mem, 'K'
            end
      end

      local function OnEnter(self)
            local i = self:GetID()
            local loaded = IsAddOnLoaded(i)
            local lod = IsAddOnLoadOnDemand(i)
            local addon, _, note, state, _, reason = GetAddOnInfo(i)

            Tip:ClearLines()
            Tip:SetOwner(self, 'ANCHOR_CURSOR_RIGHT', 30, -30)
            Tip:AddDoubleLine(self.text:GetText(), GetAddOnMetadata(i, 'Version'))
            Tip:AddLine(note, .618, .618, .618)
            Tip:AddLine(GetAddOnMetadata(i, 'Author'), .618, .382, 0)

            for profile in pairs(AWPDB) do
                  if profile ~= 'LOCKED' then
                        for _, saved in ipairs(AWPDB[profile]) do
                              if addon == saved then
                                    temporary[profile] = true
                              end
                        end
                  end
            end
            Tip:AddLine(tostring(temporary), 0, .382, .618)
            wipe(temporary)

            reason = reason and
                  ('|cFF9E0000%s|r'):format(_G['ADDON_'..reason])
            or (loaded and not state) and
                  ('%s / Reload'):format(DISABLE)
            or (not loaded and state and not lod) and
                  ('%s / Reload'):format(ACTIVATE)
            or ('|cFF009E00%s |cFF%s(%.2f%sB)|r'):format(ACTIVATE, MemoryUsage(i))

            lod = lod and ADDON_DEMAND_LOADED
            Tip:AddDoubleLine(reason, lod, 1, 1, 0, .618, .618, 0)
            Tip:Show()
      end

      local function OnClick(self, button)
            local i = self:GetID()
            local addon, _, _, state = GetAddOnInfo(i)
            if button == 'LeftButton' then
                  Switch(i, not state)
            elseif button == 'RightButton' then
                  if AWPDB.LOCKED[addon] then
                        AWPDB.LOCKED[addon] = nil
                        self:RegisterForClicks('AnyDown')
                  else
                        AWPDB.LOCKED[addon] = true
                  end
            end
            PlaySound('igMainMenuOptionCheckBoxOn')
            CheckAllState()
            OnEnter(self)
      end

      local function OnShow()
            AWPDB = AWPDB or {LOCKED={['!AWP']=true}}
            CheckAllState()
      end
      AWP:SetScript('OnShow', OnShow)

      local function Load(profile)
            if profile == '' or profile == 'LOCKED' then
                  return
            end
            local p = AWPDB[profile]
            if not p then
                  SysMsg('noexists', profile)
                  return
            end
            SwitchAll(false, true)
            for _, v in pairs(p) do
                  Switch(v, 1)
            end
            CheckAllState()
            SysMsg('load', profile)
      end

      local function Save(profile)
            if profile == '' or profile == 'LOCKED' then
                  return
            end
            local locked = AWPDB.LOCKED
            local p = {}
            for i = 1, N do
                  if C[i]:GetChecked() then
                        local addon = GetAddOnInfo(i)
                        if not locked[addon] then
                              tinsert(p, addon)
                        end
                  end
            end
            AWPDB[profile] = p
            SysMsg('save', profile)
      end

      local function Delete(profile)
            if profile == '' or profile == 'LOCKED' then
                  return
            end
            if not AWPDB[profile] then
                  SysMsg('noexists', profile)
                  return
            end
            AWPDB[profile] = nil
            SysMsg('delete', profile)
      end


------------------------
----/ Popup Dialog /----
------------------------

      StaticPopupDialogs['!AWP Save'] = {
            text = 'Enter profile name:',
            button1 = OKAY,
            button2 = CANCEL,
            hasEditBox = 1,
            hasWideEditBox = 1,
            maxLetters = 1024,
            hideOnEscape = 1,
            whileDead = 1,
            timeout = 0,

            OnShow = function(self)
                  self.button1:Disable()
            end,

            OnAccept = function(self)
                  local profile = self.editBox:GetText()
                  if profile and profile ~= '' then
                        Save(profile)
                        StaticPopup_Hide(self)
                  end
            end,

            OnCancel = StaticPopup_Hide,

            EditBoxOnTextChanged = function(self)
                  local profile = self:GetText()
                  if profile and profile ~= '' then
                        self:GetParent().button1:Enable()
                  else
                        self:GetParent().button1:Disable()
                  end
            end,

            EditBoxOnEnterPressed = function(self)
                  local profile = self:GetText()
                  if profile and profile ~= '' then
                        Save(profile)
                        StaticPopup_Hide(self:GetParent())
                  end
            end,

            EditBoxOnEscapePressed = function(self)
                  StaticPopup_Hide(self:GetParent())
            end
      } 


-------------------------
----/ Dropdown Menu /----
-------------------------

      local M = CreateFrame('Frame')
            M:Hide()
            M.displayMode = 'MENU'
            M.initialize = function(_, level)
                  local info = {
                        hasArrow = 1,
                        notCheckable = 1,
                        keepShownOnClick = 1,
                  }
                  if level == 1 then
                        info.text = 'Load'
                        info.value ='load'
                        UIDropDownMenu_AddButton(info, 1)
                        info.text = 'Save'
                        info.value = 'save'
                        UIDropDownMenu_AddButton(info, 1)
                        info.text = 'Delete'
                        info.value = 'delete'
                        UIDropDownMenu_AddButton(info, 1)
                  elseif level == 2 then
                        info.value = nil
                        info.hasArrow = nil
                        info.keepShownOnClick = nil
                        for profile in pairs(AWPDB) do
                              if profile~='LOCKED' then
                                    local text = ('%s |cFF616161(%d)|r'):format(profile, #AWPDB[profile])
                                    if UIDROPDOWNMENU_MENU_VALUE == 'load' then
                                          info.text = text
                                          info.func = function()
                                                Load(profile)
                                                CloseDropDownMenus()
                                          end
                                          UIDropDownMenu_AddButton(info, 2)
                                    elseif UIDROPDOWNMENU_MENU_VALUE == 'save' then
                                          info.text = text
                                          info.func = function()
                                                Save(profile)
                                                CloseDropDownMenus()
                                          end
                                          UIDropDownMenu_AddButton(info, 2)
                                    elseif UIDROPDOWNMENU_MENU_VALUE == 'delete' then
                                          info.text = text
                                          info.func = function()
                                                Delete(profile)
                                                CloseDropDownMenus()
                                          end
                                          UIDropDownMenu_AddButton(info, 2)
                                    end
                              end
                        end
                        if UIDROPDOWNMENU_MENU_VALUE == 'save' then
                              info.text = '|cFF9E9E9ESave As...|r'
                              info.func = function()
                                    StaticPopup_Show('!AWP Save')
                                    CloseDropDownMenus()
                              end
                              UIDropDownMenu_AddButton(info, 2)
                        end
                        if UIDROPDOWNMENU_MENU_VALUE == 'delete' then
                              info.text = '|cFF9E9E9EDelete All...|r'
                              info.func = function()
                                    for profile in pairs(AWPDB) do
                                          if profile ~= 'LOCKED' then
                                                Delete(profile)
                                          end
                                    end
                                    CloseDropDownMenus()
                              end
                              UIDropDownMenu_AddButton(info, 2)
                        end
                  end
                  wipe(info)
            end


------------------
----/ Button /----
------------------

      local function Button(text, ...)
             local b = CreateFrame('Button', nil, AWP)
                   b:SetNormalTexture('Interface/Buttons/WHITE8x8')
                   b:GetNormalTexture():SetVertexColor(0, 0, 0, .382)
                   b:SetHighlightTexture('Interface/Buttons/WHITE8x8')
                   b:GetHighlightTexture():SetVertexColor(.382, .382, .382, .382)
                   b:SetNormalFontObject(SystemFont_Shadow_Small)
                   b:SetFormattedText('|cFF9E9E9E%s|r', text)
                   b:SetSize(16, 16)
                   b:SetPoint(...)
            return b
      end

      local X = Button('X', 'TOPRIGHT', -4, -4)
            X:SetScript('OnClick', function()
                  AWP:Hide()
            end)

      local R = Button('R', 'BOTTOMRIGHT', -4, 4)
            R:SetScript('OnClick', ReloadUI)

      local P = Button('P', 'BOTTOMLEFT', 4, 4)
            P:SetScript('OnClick', function()
                  ToggleDropDownMenu(1, nil, M, AWP, 0, 0)
            end)

      local U = Button('Reset', 'BOTTOM', 0, 4)
            U:SetWidth(19 + select(3, U:GetRegions()):GetWidth())
            U:SetScript('OnClick', function()
                  ResetDisabledAddOns()
                  CheckAllState()
            end)

      local function CheckButton(parent, ...)
            local cb = CreateFrame('CheckButton', nil, parent, 'UICheckButtonTemplate')
                  cb:GetNormalTexture():SetVertexColor(0, 0, 0, .382)
                  cb:SetPushedTexture(nil)
                  cb:SetHighlightTexture('Interface/Buttons/WHITE8x8')
                  cb:GetHighlightTexture():SetVertexColor(1, 1, 1)
                  cb:SetCheckedTexture('Interface/Buttons/WHITE8x8')
                  cb:SetDisabledCheckedTexture(nil)
                  cb:SetScript('OnClick', CheckSound)
                  cb:RegisterForClicks('LeftButtonDown', 'RightButtonDown')
                  cb:SetSize(16, 16)
                  cb:SetPoint(...)
           return cb
      end

      local A = CheckButton(AWP, 'TOPLEFT', 4, -4)
            A:SetNormalTexture('Interface/Buttons/WHITE8x8')
            A:GetCheckedTexture():SetVertexColor(.618, .618, .618)
            A:SetScript('OnClick', function(self)
                  SwitchAll(self:GetChecked())
            end)


----------------------
---// Addon List //---
----------------------

      local function AddonButton(i)
            local cb = CheckButton(C, 'TOPLEFT', 5, -20*(i-1)-1)
                  cb:SetID(i)
                  cb:SetScript('OnClick', OnClick)
                  cb:SetScript('OnEnter', OnEnter)
                  cb:SetScript('OnLeave', GameTooltip_Hide)
                  cb:SetHitRectInsets(0, -2880, 0, 0)
                  cb:SetNormalFontObject(SystemFont_Med2)
                  cb.text:SetPoint('LEFT', cb, 'RIGHT', 3, 0)

                  if IsAddOnLoadOnDemand(i) then
                        cb:SetAlpha(.618)
                  end

                  local n = select('#', GetAddOnDependencies(i))

                  if n < 1 then
                        return cb
                  else
                        for x = 1, n do
                              n = select(x, GetAddOnDependencies(i))
                              temporary[n] = true
                        end

                        n = tostring(temporary)
                        wipe(temporary)

                        local dep = cb:CreateFontString(nil, nil, 'SystemFont_Med1')
                              dep:SetPoint('RIGHT', C, 'RIGHT', -5, 0)
                              dep:SetPoint('LEFT', cb.text, 'RIGHT', 3, 0)
                              dep:SetJustifyH('RIGHT')
                              dep:SetTextColor(.618, .382, 0)
                              dep:SetText(n)

                        return cb
                  end
      end

      for i = 1, N do
            C[i] = AddonButton(i)
      end


-------------------------
----/ Slash Command /----
-------------------------

      SLASH_AWP1 = '/awp'
      SlashCmdList.AWP = function(x)
            if not x or x == '' then
                  AWP:SetShown(not AWP:IsShown())
                  return
            else
                  local cmd, profile = x:match('^(%S*)%s*(.-)$')
                  if cmd == 'load' then
                        Load(profile)
                        return
                  elseif cmd == 'save' then
                        CheckAllState()
                        Save(profile)
                  elseif cmd == 'delete' then
                        Delete(profile)
                        return
                  elseif cmd == 'list' then
                        for profile in pairs(AWPDB) do
                              if profile ~= 'LOCKED' then
                                    SysMsg('list', profile, #AWPDB[profile])
                              end
                        end
                        return
                  elseif cmd == 'help' then
                        for i = 1, 6 do
                              SysMsg('help'..i)
                        end
                        return 
                  elseif cmd == 'kill' then
                        AWPDB = {LOCKED={['!AWP']=true}}
                        SysMsg('kill')
                        return 
                  end
            end
      end

      SLASH_RELOADUI1 = '/rl'
      SlashCmdList.RELOADUI = ReloadUI


--------------------------
----/ GameMenuButton /----
--------------------------

local GameMenuButtonAddOns = CreateFrame('Button', 'GameMenuButtonAddOns', GameMenuFrame, 'GameMenuButtonTemplate')
      GameMenuButtonAddOns:SetPoint('TOP', GameMenuButtonUIOptions, 'BOTTOM', 0, -1)
      GameMenuButtonAddOns:SetText(ADDONS)
      GameMenuButtonAddOns:SetScript('OnClick', function()
            PlaySound('igMainMenuOption')
            HideUIPanel(GameMenuFrame)
            AWP:SetShown(1)
      end)

GameMenuButtonKeybindings:SetPoint('TOP', GameMenuButtonAddOns, 'BOTTOM', 0, -1)
GameMenuFrame:HookScript('OnShow', function(self)self:SetHeight(26+self:GetHeight())end)
