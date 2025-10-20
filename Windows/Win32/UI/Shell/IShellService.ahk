#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. IShellService Exposes one method that declares ownership when a service component implementing a certain interface is shared among multiple clients, such as Windows Internet Explorer and Windows Explorer.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ishellservice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellService extends IUnknown{
    /**
     * The interface identifier for IShellService
     * @type {Guid}
     */
    static IID => Guid("{5836fb00-8187-11cf-a12b-00aa004ae837}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punkOwner 
     * @returns {HRESULT} 
     */
    SetOwner(punkOwner) {
        result := ComCall(3, this, "ptr", punkOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
