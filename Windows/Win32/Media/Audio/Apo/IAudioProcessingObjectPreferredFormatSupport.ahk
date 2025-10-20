#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectPreferredFormatSupport extends IUnknown{
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
     * 
     * @param {Pointer<IAudioMediaType>} outputFormat 
     * @param {Pointer<IAudioMediaType>} preferredFormat 
     * @returns {HRESULT} 
     */
    GetPreferredInputFormat(outputFormat, preferredFormat) {
        result := ComCall(3, this, "ptr", outputFormat, "ptr", preferredFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioMediaType>} inputFormat 
     * @param {Pointer<IAudioMediaType>} preferredFormat 
     * @returns {HRESULT} 
     */
    GetPreferredOutputFormat(inputFormat, preferredFormat) {
        result := ComCall(4, this, "ptr", inputFormat, "ptr", preferredFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
