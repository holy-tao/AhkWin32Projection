#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcVersionInfo3 extends IUnknown{
    /**
     * The interface identifier for IDxcVersionInfo3
     * @type {Guid}
     */
    static IID => Guid("{5e13e843-9d25-473c-9ad2-03b2d0b44b1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SByte>} pVersionString 
     * @returns {HRESULT} 
     */
    GetCustomVersionString(pVersionString) {
        result := ComCall(3, this, "char*", pVersionString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
