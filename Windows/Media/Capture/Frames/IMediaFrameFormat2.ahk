#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameFormat2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameFormat2
     * @type {Guid}
     */
    static IID => Guid("{63856340-5e87-4c10-86d1-6df097a6c6a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioEncodingProperties"]

    /**
     * @type {AudioEncodingProperties} 
     */
    AudioEncodingProperties {
        get => this.get_AudioEncodingProperties()
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_AudioEncodingProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }
}
