#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDigitalLocator.ahk

/**
 * The IDVBCLocator interface is implemented on DVBCLocator objects, which contain tuning information for DVB-C networks.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBCLocator)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbclocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBCLocator extends IDigitalLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBCLocator
     * @type {Guid}
     */
    static IID => Guid("{6e42f36e-1dd2-43c4-9f78-69d25ae39034}")

    /**
     * The class identifier for DVBCLocator
     * @type {Guid}
     */
    static CLSID => Guid("{c531d9fd-9685-4028-8b68-6e1232079f1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
