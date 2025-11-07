#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQPrivateDestination extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQPrivateDestination
     * @type {Guid}
     */
    static IID => Guid("{eba96b17-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handle", "put_Handle"]

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Handle() {
        pvarHandle := VARIANT()
        result := ComCall(7, this, "ptr", pvarHandle, "HRESULT")
        return pvarHandle
    }

    /**
     * 
     * @param {VARIANT} varHandle 
     * @returns {HRESULT} 
     */
    put_Handle(varHandle) {
        result := ComCall(8, this, "ptr", varHandle, "HRESULT")
        return result
    }
}
