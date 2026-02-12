#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IAudioEncodingPropertiesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEncodingPropertiesStatics2
     * @type {Guid}
     */
    static IID => Guid("{7489316f-77a0-433d-8ed5-4040280e8665}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAlac", "CreateFlac"]

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitsPerSample 
     * @returns {AudioEncodingProperties} 
     */
    CreateAlac(sampleRate, channelCount, bitsPerSample) {
        result := ComCall(6, this, "uint", sampleRate, "uint", channelCount, "uint", bitsPerSample, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitsPerSample 
     * @returns {AudioEncodingProperties} 
     */
    CreateFlac(sampleRate, channelCount, bitsPerSample) {
        result := ComCall(7, this, "uint", sampleRate, "uint", channelCount, "uint", bitsPerSample, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }
}
