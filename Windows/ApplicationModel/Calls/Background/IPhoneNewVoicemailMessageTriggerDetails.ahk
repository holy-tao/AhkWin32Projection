#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class IPhoneNewVoicemailMessageTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNewVoicemailMessageTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{13a8c01b-b831-48d3-8ba9-8d22a6580dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LineId", "get_VoicemailCount", "get_OperatorMessage"]

    /**
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * @type {Integer} 
     */
    VoicemailCount {
        get => this.get_VoicemailCount()
    }

    /**
     * @type {HSTRING} 
     */
    OperatorMessage {
        get => this.get_OperatorMessage()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        result_ := Guid()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VoicemailCount() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OperatorMessage() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
