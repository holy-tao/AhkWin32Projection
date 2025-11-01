#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Handles events that are generated or received by a IRendezvousSession object.
 * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nn-rendezvoussession-drendezvoussessionevents
 * @namespace Windows.Win32.System.RemoteAssistance
 * @version v4.0.30319
 */
class DRendezvousSessionEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DRendezvousSessionEvents
     * @type {Guid}
     */
    static IID => Guid("{3fa19cf8-64c4-4f53-ae60-635b3806eca6}")

    /**
     * The class identifier for DRendezvousSessionEvents
     * @type {Guid}
     */
    static CLSID => Guid("{3fa19cf8-64c4-4f53-ae60-635b3806eca6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
