#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPerChannelDbLevel.ahk

/**
 * The IAudioVolumeLevel interface provides access to a hardware volume control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiovolumelevel
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioVolumeLevel extends IPerChannelDbLevel{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioVolumeLevel
     * @type {Guid}
     */
    static IID => Guid("{7fb7b48f-531d-44a2-bcb3-5ad5a134b3dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
