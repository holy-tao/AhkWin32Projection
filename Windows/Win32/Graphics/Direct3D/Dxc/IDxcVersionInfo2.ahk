#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcVersionInfo.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcVersionInfo2 extends IDxcVersionInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcVersionInfo2
     * @type {Guid}
     */
    static IID => Guid("{fb6904c4-42f0-4b62-9c46-983af7da7c83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCommitInfo"]

    /**
     * 
     * @param {Pointer<Integer>} pCommitCount 
     * @param {Pointer<Pointer<Integer>>} pCommitHash 
     * @returns {HRESULT} 
     */
    GetCommitInfo(pCommitCount, pCommitHash) {
        pCommitCountMarshal := pCommitCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pCommitCountMarshal, pCommitCount, "ptr*", pCommitHash, "HRESULT")
        return result
    }
}
