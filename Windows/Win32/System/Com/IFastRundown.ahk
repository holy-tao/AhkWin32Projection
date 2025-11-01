#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Marks an interface as eligible for fast rundown behavior.
 * @remarks
 * 
  * A Component Object Model (COM) object implements the <b>IFastRundown</b> marker interface to opt into the fast rundown behavior.
  * 
  * All Windows Store app processes, as well as the broker processes RuntimeBroker.exe and PickerHost.exe, apply fast rundown at the process level, which means that all objects in any of these processes are subjected to fast rundown automatically. Desktop processes don't get this behavior by default and must opt in at the process level. Specific objects opt in by implementing the <b>IFastRundown</b> marker interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ifastrundown
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IFastRundown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFastRundown
     * @type {Guid}
     */
    static IID => Guid("{00000040-0000-0000-c000-000000000046}")

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
