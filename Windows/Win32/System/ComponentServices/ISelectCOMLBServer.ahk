#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Activates the COM+ component load balancing service.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iselectcomlbserver
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISelectCOMLBServer extends IUnknown{
    /**
     * The interface identifier for ISelectCOMLBServer
     * @type {Guid}
     */
    static IID => Guid("{dcf443f4-3f8a-4872-b9f0-369a796d12d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Init() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    GetLBServer(pUnk) {
        result := ComCall(4, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
