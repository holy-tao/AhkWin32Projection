#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Implements an event that Protected Broadcast Driver Architecture (PBDA) Media Transform Devices (MTDs) use to inform a Media Sink Device that the MTD has updated the value for a name-value pair or exposed a new name-value pair.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESValueUpdatedEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesvalueupdatedevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESValueUpdatedEvent extends IESEvent{
    /**
     * The interface identifier for IESValueUpdatedEvent
     * @type {Guid}
     */
    static IID => Guid("{8a24c46e-bb63-4664-8602-5d9c718c146d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pbstrNames 
     * @returns {HRESULT} 
     */
    GetValueNames(pbstrNames) {
        result := ComCall(8, this, "ptr", pbstrNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
