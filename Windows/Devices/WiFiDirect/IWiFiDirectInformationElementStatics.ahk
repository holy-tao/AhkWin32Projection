#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\WiFiDirectInformationElement.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectInformationElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectInformationElementStatics
     * @type {Guid}
     */
    static IID => Guid("{dbd02f16-11a5-4e60-8caa-34772148378a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromBuffer", "CreateFromDeviceInformation"]

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {IVector<WiFiDirectInformationElement>} 
     */
    CreateFromBuffer(buffer_) {
        result := ComCall(6, this, "ptr", buffer_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WiFiDirectInformationElement, result_)
    }

    /**
     * 
     * @param {DeviceInformation} deviceInformation_ 
     * @returns {IVector<WiFiDirectInformationElement>} 
     */
    CreateFromDeviceInformation(deviceInformation_) {
        result := ComCall(7, this, "ptr", deviceInformation_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WiFiDirectInformationElement, result_)
    }
}
