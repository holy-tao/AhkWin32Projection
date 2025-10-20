#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPerChannelDbLevel.ahk

/**
 * The IAudioBass interface provides access to a hardware bass-level control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiobass
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioBass extends IPerChannelDbLevel{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioBass
     * @type {Guid}
     */
    static IID => Guid("{a2b1a1d9-4db3-425d-a2b2-bd335cb3e2e5}")

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
