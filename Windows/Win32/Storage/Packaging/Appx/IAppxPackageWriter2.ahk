#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for app packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxpackagewriter2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackageWriter2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxPackageWriter2
     * @type {Guid}
     */
    static IID => Guid("{2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close"]

    /**
     * 
     * @param {IStream} manifest 
     * @param {IStream} contentGroupMap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter2-close
     */
    Close(manifest, contentGroupMap) {
        result := ComCall(3, this, "ptr", manifest, "ptr", contentGroupMap, "HRESULT")
        return result
    }
}
