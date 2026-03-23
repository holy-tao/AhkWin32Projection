#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleReader2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleReader2
     * @type {Guid}
     */
    static IID => Guid("{98262195-d63a-4c10-b4cf-dd72e061ba87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPayloadPackageReader"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {IAppxPackageReader} 
     */
    GetPayloadPackageReader(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr*", &payloadPackageReader := 0, "HRESULT")
        return IAppxPackageReader(payloadPackageReader)
    }
}
