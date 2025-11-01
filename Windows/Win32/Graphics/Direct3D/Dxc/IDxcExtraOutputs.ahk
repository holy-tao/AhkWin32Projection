#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcExtraOutputs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcExtraOutputs
     * @type {Guid}
     */
    static IID => Guid("{319b37a2-a5c2-494a-a5de-4801b2faf989}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputCount", "GetOutput"]

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputType 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputName 
     * @returns {HRESULT} 
     */
    GetOutput(uIndex, iid, ppvObject, ppOutputType, ppOutputName) {
        result := ComCall(4, this, "uint", uIndex, "ptr", iid, "ptr*", ppvObject, "ptr*", ppOutputType, "ptr*", ppOutputName, "HRESULT")
        return result
    }
}
