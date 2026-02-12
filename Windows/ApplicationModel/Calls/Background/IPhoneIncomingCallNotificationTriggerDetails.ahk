#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class IPhoneIncomingCallNotificationTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneIncomingCallNotificationTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{2b0e6044-9b32-5d42-8222-d2812e39fb21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LineId", "get_CallId"]

    /**
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * @type {HSTRING} 
     */
    CallId {
        get => this.get_CallId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
