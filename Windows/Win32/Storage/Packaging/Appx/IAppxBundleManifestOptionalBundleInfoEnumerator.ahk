#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleManifestOptionalBundleInfo.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the optional bundle information from a bundle.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestOptionalBundleInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestOptionalBundleInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{9a178793-f97e-46ac-aaca-dd5ba4c177c8}")

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
     * Gets the optional bundle information at the current position of the enumerator.
     * @returns {IAppxBundleManifestOptionalBundleInfo} The optional bundle information.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &optionalBundle := 0, "HRESULT")
        return IAppxBundleManifestOptionalBundleInfo(optionalBundle)
    }

    /**
     * Determines whether there is optional bundle information at the current position of the enumerator.
     * @returns {BOOL} <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, "int*", &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next set of optional bundle information.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }
}
