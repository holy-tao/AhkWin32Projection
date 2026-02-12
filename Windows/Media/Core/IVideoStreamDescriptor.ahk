#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MediaProperties\VideoEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IVideoStreamDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoStreamDescriptor
     * @type {Guid}
     */
    static IID => Guid("{12ee0d55-9c2b-4440-8057-2c7a90f0cbec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncodingProperties"]

    /**
     * @type {VideoEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_EncodingProperties() {
        result := ComCall(6, this, "ptr*", &encodingProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(encodingProperties)
    }
}
