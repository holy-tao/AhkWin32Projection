#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Direct3D11
 * @version v4.0.30319
 */
class IDirect3DDxgiInterfaceAccess extends IUnknown{
    /**
     * The interface identifier for IDirect3DDxgiInterfaceAccess
     * @type {Guid}
     */
    static IID => Guid("{a9b3d012-3df2-4ee3-b8d1-8695f457d3c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} p 
     * @returns {HRESULT} 
     */
    GetInterface(iid, p) {
        result := ComCall(3, this, "ptr", iid, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
