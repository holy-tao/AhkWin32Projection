#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\HEAACWAVEINFO.ahk

/**
 * Contains format data for an AAC or HE-AAC stream that includes AudioSpecificConfig() data.
 * @remarks
 * Use this structure to access the AudioSpecificConfig() data that follows an <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-heaacwaveinfo">HEAACWAVEINFO</a> structure. This data is present only when the <b>wStructType</b> member of the <b>HEAACWAVEFORMAT</b> structure is zero.
 * @see https://learn.microsoft.com/windows/win32/api/mmreg/ns-mmreg-heaacwaveformat
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class HEAACWAVEFORMAT extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-heaacwaveinfo">HEAACWAVEINFO</a> structure.
     * @type {HEAACWAVEINFO}
     */
    wfInfo{
        get {
            if(!this.HasProp("__wfInfo"))
                this.__wfInfo := HEAACWAVEINFO(0, this)
            return this.__wfInfo
        }
    }

    /**
     * A byte array that contains the value of AudioSpecificConfig(), as defined by ISO/IEC 14496-3. The array might be larger than the size given in the structure declaration. Use the value of <b>wfInfo.wfx.cbSize</b>  to determine the size.
     * @type {Array<Byte>}
     */
    pbAudioSpecificConfig{
        get {
            if(!this.HasProp("__pbAudioSpecificConfigProxyArray"))
                this.__pbAudioSpecificConfigProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__pbAudioSpecificConfigProxyArray
        }
    }
}
