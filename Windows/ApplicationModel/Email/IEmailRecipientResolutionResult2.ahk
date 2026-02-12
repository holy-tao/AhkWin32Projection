#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailRecipientResolutionResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailRecipientResolutionResult2
     * @type {Guid}
     */
    static IID => Guid("{5e420bb6-ce5b-4bde-b9d4-e16da0b09fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Status", "SetPublicKeys"]

    /**
     * @type {HRESULT} 
     */
    Status {
        set => this.put_Status(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<Certificate>} value 
     * @returns {HRESULT} 
     */
    SetPublicKeys(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
