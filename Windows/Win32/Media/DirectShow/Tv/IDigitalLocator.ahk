#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ILocator.ahk

/**
 * The IDigitalLocator interface serves as the base interface for Locator objects that contain tuning information about the tuning space for a digital network. This interface is used only through derived interfaces such as IATSCLocator.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalLocator)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idigitallocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDigitalLocator extends ILocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalLocator
     * @type {Guid}
     */
    static IID => Guid("{19b595d8-839a-47f0-96df-4f194f3c768c}")

    /**
     * The class identifier for DigitalLocator
     * @type {Guid}
     */
    static CLSID => Guid("{6e50cc0d-c19b-4bf6-810b-5bd60761f5cc}")

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
