#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectPreferredFormatSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectPreferredFormatSupport
     * @type {Guid}
     */
    static IID => Guid("{51cbd3c4-f1f3-4d2f-a0e1-7e9c4dd0feb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredInputFormat", "GetPreferredOutputFormat"]

    /**
     * 
     * @param {IAudioMediaType} outputFormat 
     * @param {Pointer<IAudioMediaType>} preferredFormat 
     * @returns {HRESULT} 
     */
    GetPreferredInputFormat(outputFormat, preferredFormat) {
        result := ComCall(3, this, "ptr", outputFormat, "ptr*", preferredFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioMediaType} inputFormat 
     * @param {Pointer<IAudioMediaType>} preferredFormat 
     * @returns {HRESULT} 
     */
    GetPreferredOutputFormat(inputFormat, preferredFormat) {
        result := ComCall(4, this, "ptr", inputFormat, "ptr*", preferredFormat, "HRESULT")
        return result
    }
}
