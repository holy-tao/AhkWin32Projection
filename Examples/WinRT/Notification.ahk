#Requires AutoHotkey v2.0
#Include ../../Windows/UI/Notifications/ToastNotification.ahk
#Include ../../Windows/UI/Notifications/ToastNotificationManager.ahk
#Include ../../Windows/UI/Notifications/ToastTemplateType.ahk
#Include ../../Windows/UI/Notifications/ToastDismissedEventArgs.ahk
#Include ../../Windows/UI/Notifications/ToastActivatedEventArgs.ahk
#Include ../../Windows/UI/Notifications/ToastDismissalReason.ahk
#Include ../../Windows/Win32/UI/Shell/Apis.ahk

; This example demonstrats using arbitrary XML, and taking action depending on what the user does.
; Learn more on MSDN:
;   https://learn.microsoft.com/en-us/windows/apps/develop/notifications/app-notifications/adaptive-interactive-toasts?tabs=appsdk
toastXmlStr := Format("
(
    <toast launch='the main body of the toast'>
        <visual>
            <binding template='ToastGeneric'>
                <image placement='hero' src='{1}'/>
                <text>Hello from AutoHotkey!</text>
                <text>This is an example toast message. You can put up to two lines of text in it. Do you like the picture?</text>
                <text placement='attribution'>Via lorem picsum</text>
            </binding>
        </visual>
        <actions>
            <action content='Yes' arguments='the Yes button'/>
            <action content='No' arguments='the No button'/>
        </actions>
    </toast>
)", A_ScriptDir . "\sample-image.jpg")

; We need an AppUserModelID to assosciate the toast with. The script itself doesn't have an app ID (try importing 
; Windows.ApplicationModel.AppInfo and checking AppInfo.Current.AppUserModelID), so for the sake of the example we
; pretend to be the AutoHotkey dash. Since it has a shortcut in the Start menu, it has an AppID.
;   See https://learn.microsoft.com/en-us/windows/win32/shell/appids
;   Specifically: https://learn.microsoft.com/en-us/windows/win32/shell/appids#where-to-assign-an-appusermodelid
; 
; Note that while it's possible to set this in code by calling Shell.SetCurrentProcessExplicitAppUserModelID, I
; haven't been able to get this to work in AHK - maybe the invisible window or the icon and tray entry the interpreter 
; create count as "UI" for the purposes of this function and it fails

ToastNotificationManager.History.ClearWithId("AutoHotkey.AutoHotkey")
notifier := ToastNotificationManager.CreateToastNotifierWithId("AutoHotkey.AutoHotkey")

toastXml := XmlDocument()
toastXml.LoadXml(toastXmlStr)

notification := ToastNotification.CreateToastNotification(toastXml)

; Register event handlers - IToastActivatedEventArgs.Arguments has the arguments we
; specified in the XML above
notification.OnDismissed((toast, args) => MsgBox("Toast dismissed: " ToastDismissalReason.ToString(args.Reason)))
notification.OnDismissed((*) => Persistent(false))

notification.OnActivated((*) => Persistent(false))
notification.OnActivated((toast, obj) => MsgBox("User clicked " String(obj.As(ToastActivatedEventArgs).Arguments)), -1)
notification.OnActivated((*) => MsgBox("This callback is never called, because Persistent(false) returns 1"))

notifier.Show(notification)

; Note that the script exits immediately, but the notification will still show, so to handle the event we need to
; keep the script alive. Otherwise we'd need to implement a COM server
Persistent()