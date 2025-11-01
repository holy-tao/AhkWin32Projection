#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IATSCLocator2.ahk

/**
 * The IDigitalCableLocator interface provides tuning information for a digital cable network.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalCableLocator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idigitalcablelocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDigitalCableLocator extends IATSCLocator2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalCableLocator
     * @type {Guid}
     */
    static IID => Guid("{48f66a11-171a-419a-9525-beeecd51584c}")

    /**
     * The class identifier for DigitalCableLocator
     * @type {Guid}
     */
    static CLSID => Guid("{03c06416-d127-407a-ab4c-fdd279abbe5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
