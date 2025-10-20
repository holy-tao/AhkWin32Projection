#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcVersionInfo.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcVersionInfo2 extends IDxcVersionInfo{
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
     * 
     * @param {Pointer<UInt32>} pCommitCount 
     * @param {Pointer<SByte>} pCommitHash 
     * @returns {HRESULT} 
     */
    GetCommitInfo(pCommitCount, pCommitHash) {
        result := ComCall(5, this, "uint*", pCommitCount, "char*", pCommitHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
