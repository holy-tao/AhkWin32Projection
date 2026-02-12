#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TwoPanelHingedDevicePosturePreviewReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2d2d1bc6-02ce-474a-a556-a75b1cf93a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reading"]

    /**
     * @type {TwoPanelHingedDevicePosturePreviewReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {TwoPanelHingedDevicePosturePreviewReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TwoPanelHingedDevicePosturePreviewReading(value)
    }
}
