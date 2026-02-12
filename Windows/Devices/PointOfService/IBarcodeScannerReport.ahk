#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerReport
     * @type {Guid}
     */
    static IID => Guid("{5ce4d8b0-a489-4b96-86c4-f0bf8a37753d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScanDataType", "get_ScanData", "get_ScanDataLabel"]

    /**
     * @type {Integer} 
     */
    ScanDataType {
        get => this.get_ScanDataType()
    }

    /**
     * @type {IBuffer} 
     */
    ScanData {
        get => this.get_ScanData()
    }

    /**
     * @type {IBuffer} 
     */
    ScanDataLabel {
        get => this.get_ScanDataLabel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanDataType() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ScanData() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ScanDataLabel() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
