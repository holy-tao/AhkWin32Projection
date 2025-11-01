#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnPropertyUIStatus interface is implemented by a text service and used by an application or text service to obtain and set the status of the text service property UI.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnpropertyuistatus
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnPropertyUIStatus extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnPropertyUIStatus
     * @type {Guid}
     */
    static IID => Guid("{2338ac6e-2b9d-44c0-a75e-ee64f256b3bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "SetStatus"]

    /**
     * 
     * @param {Pointer<Guid>} refguidProp 
     * @param {Pointer<Integer>} pdw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-getstatus
     */
    GetStatus(refguidProp, pdw) {
        result := ComCall(4, this, "ptr", refguidProp, "uint*", pdw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguidProp 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-setstatus
     */
    SetStatus(refguidProp, dw) {
        result := ComCall(5, this, "ptr", refguidProp, "uint", dw, "HRESULT")
        return result
    }
}
