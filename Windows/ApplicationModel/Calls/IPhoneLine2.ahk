#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLine2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLine2
     * @type {Guid}
     */
    static IID => Guid("{0167f56a-5344-5d64-8af3-a31a950e916a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableTextReply", "get_TransportDeviceId"]

    /**
     * @type {HSTRING} 
     */
    TransportDeviceId {
        get => this.get_TransportDeviceId()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    EnableTextReply(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportDeviceId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
