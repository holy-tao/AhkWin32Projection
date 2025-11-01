#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationFactory_SupportHdrAware extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationFactory_SupportHdrAware
     * @type {Guid}
     */
    static IID => Guid("{2bd0b885-a16f-4bd9-a59a-d073e069d416}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
