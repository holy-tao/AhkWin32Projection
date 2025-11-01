#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlobEncoding.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcBlobUtf8 extends IDxcBlobEncoding{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcBlobUtf8
     * @type {Guid}
     */
    static IID => Guid("{3da636c9-ba71-4024-a301-30cbf125305b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringPointer", "GetStringLength"]

    /**
     * 
     * @returns {PSTR} 
     */
    GetStringPointer() {
        result := ComCall(6, this, "char*")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetStringLength() {
        result := ComCall(7, this, "ptr")
        return result
    }
}
