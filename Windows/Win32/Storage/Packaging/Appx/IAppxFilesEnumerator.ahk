#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the payload files in a package.
 * @remarks
 * 
  * To get the footprint files, use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getfootprintfile">IAppxPackageReader::GetFootprintFile</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfilesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFilesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFilesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{f007eeaf-9831-411c-9847-917cdc62d1fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * 
     * @param {Pointer<IAppxFile>} file 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfilesenumerator-getcurrent
     */
    GetCurrent(file) {
        result := ComCall(3, this, "ptr*", file, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfilesenumerator-gethascurrent
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfilesenumerator-movenext
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "HRESULT")
        return result
    }
}
