#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderTrackData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderTrackData
     * @type {Guid}
     */
    static IID => Guid("{104cf671-4a9d-446e-abc5-20402307ba36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "get_DiscretionaryData", "get_EncryptedData"]

    /**
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {IBuffer} 
     */
    DiscretionaryData {
        get => this.get_DiscretionaryData()
    }

    /**
     * @type {IBuffer} 
     */
    EncryptedData {
        get => this.get_EncryptedData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DiscretionaryData() {
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
    get_EncryptedData() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
