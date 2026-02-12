#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotifier2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotifier2
     * @type {Guid}
     */
    static IID => Guid("{354389c6-7c01-4bd5-9c20-604340cd2b74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateWithTagAndGroup", "UpdateWithTag"]

    /**
     * Learn more about: Update constructor
     * @param {NotificationData} data 
     * @param {HSTRING} tag 
     * @param {HSTRING} group 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    UpdateWithTagAndGroup(data, tag, group) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group

        result := ComCall(6, this, "ptr", data, "ptr", tag, "ptr", group, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Learn more about: Update constructor
     * @param {NotificationData} data 
     * @param {HSTRING} tag 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    UpdateWithTag(data, tag) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag

        result := ComCall(7, this, "ptr", data, "ptr", tag, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
