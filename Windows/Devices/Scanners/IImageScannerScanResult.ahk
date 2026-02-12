#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class IImageScannerScanResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageScannerScanResult
     * @type {Guid}
     */
    static IID => Guid("{c91624cd-9037-4e48-84c1-ac0975076bc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScannedFiles"]

    /**
     * @type {IVectorView<StorageFile>} 
     */
    ScannedFiles {
        get => this.get_ScannedFiles()
    }

    /**
     * 
     * @returns {IVectorView<StorageFile>} 
     */
    get_ScannedFiles() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StorageFile, value)
    }
}
