#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\BarcodeScannerFrameReader.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerProviderConnection2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerProviderConnection2
     * @type {Guid}
     */
    static IID => Guid("{be9b53cd-1134-418c-a06b-04423a73f3d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFrameReaderAsync", "CreateFrameReaderWithFormatAsync", "CreateFrameReaderWithFormatAndSizeAsync"]

    /**
     * 
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     */
    CreateFrameReaderAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BarcodeScannerFrameReader, operation)
    }

    /**
     * 
     * @param {Integer} preferredFormat_ 
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     */
    CreateFrameReaderWithFormatAsync(preferredFormat_) {
        result := ComCall(7, this, "int", preferredFormat_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BarcodeScannerFrameReader, operation)
    }

    /**
     * 
     * @param {Integer} preferredFormat_ 
     * @param {BitmapSize} preferredSize 
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     */
    CreateFrameReaderWithFormatAndSizeAsync(preferredFormat_, preferredSize) {
        result := ComCall(8, this, "int", preferredFormat_, "ptr", preferredSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BarcodeScannerFrameReader, operation)
    }
}
