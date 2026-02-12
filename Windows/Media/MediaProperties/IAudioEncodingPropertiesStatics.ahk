#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IAudioEncodingPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEncodingPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{0cad332c-ebe9-4527-b36d-e42a13cf38db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAac", "CreateAacAdts", "CreateMp3", "CreatePcm", "CreateWma"]

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitrate 
     * @returns {AudioEncodingProperties} 
     */
    CreateAac(sampleRate, channelCount, bitrate) {
        result := ComCall(6, this, "uint", sampleRate, "uint", channelCount, "uint", bitrate, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitrate 
     * @returns {AudioEncodingProperties} 
     */
    CreateAacAdts(sampleRate, channelCount, bitrate) {
        result := ComCall(7, this, "uint", sampleRate, "uint", channelCount, "uint", bitrate, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitrate 
     * @returns {AudioEncodingProperties} 
     */
    CreateMp3(sampleRate, channelCount, bitrate) {
        result := ComCall(8, this, "uint", sampleRate, "uint", channelCount, "uint", bitrate, "ptr*", &value := 0, "int")
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
    CreatePcm(sampleRate, channelCount, bitsPerSample) {
        result := ComCall(9, this, "uint", sampleRate, "uint", channelCount, "uint", bitsPerSample, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @param {Integer} sampleRate 
     * @param {Integer} channelCount 
     * @param {Integer} bitrate 
     * @returns {AudioEncodingProperties} 
     */
    CreateWma(sampleRate, channelCount, bitrate) {
        result := ComCall(10, this, "uint", sampleRate, "uint", channelCount, "uint", bitrate, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }
}
