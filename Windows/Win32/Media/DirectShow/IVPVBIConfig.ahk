#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVPBaseConfig.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPVBIConfig extends IVPBaseConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVPVBIConfig
     * @type {Guid}
     */
    static IID => Guid("{ec529b00-1a1f-11d1-bad9-00609744111a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
