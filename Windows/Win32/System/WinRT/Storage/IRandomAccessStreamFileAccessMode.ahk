#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the file access mode that was used when the StorageFile.OpenAsync method was called to open the random-access byte stream.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-irandomaccessstreamfileaccessmode
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IRandomAccessStreamFileAccessMode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStreamFileAccessMode
     * @type {Guid}
     */
    static IID => Guid("{332e5848-2e15-458e-85c4-c911c0c3d6f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMode"]

    /**
     * 
     * @param {Pointer<Integer>} fileAccessMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-irandomaccessstreamfileaccessmode-getmode
     */
    GetMode(fileAccessMode) {
        fileAccessModeMarshal := fileAccessMode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, fileAccessModeMarshal, fileAccessMode, "HRESULT")
        return result
    }
}
