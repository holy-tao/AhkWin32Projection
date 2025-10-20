#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPerChannelDbLevel.ahk

/**
 * The IAudioMidrange interface provides access to a hardware midrange-level control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiomidrange
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioMidrange extends IPerChannelDbLevel{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioMidrange
     * @type {Guid}
     */
    static IID => Guid("{5e54b6d7-b44b-40d9-9a9e-e691d9ce6edf}")

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
