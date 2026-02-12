#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MediaProperties\VideoEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IVideoStreamConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoStreamConfiguration
     * @type {Guid}
     */
    static IID => Guid("{d8770a6f-4390-4b5e-ad3e-0f8af0963490}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InputProperties", "get_OutputProperties"]

    /**
     * @type {VideoEncodingProperties} 
     */
    InputProperties {
        get => this.get_InputProperties()
    }

    /**
     * @type {VideoEncodingProperties} 
     */
    OutputProperties {
        get => this.get_OutputProperties()
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_InputProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_OutputProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }
}
