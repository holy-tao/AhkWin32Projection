#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _EventConnector extends IDispatch{
    /**
     * The interface identifier for _EventConnector
     * @type {Guid}
     */
    static IID => Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    /**
     * The class identifier for _EventConnector
     * @type {Guid}
     */
    static CLSID => Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<_Application>} Application 
     * @returns {HRESULT} 
     */
    ConnectTo(Application) {
        result := ComCall(7, this, "ptr", Application, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
