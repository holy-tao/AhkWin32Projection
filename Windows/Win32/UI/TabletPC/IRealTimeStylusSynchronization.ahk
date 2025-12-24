#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Synchronizes access to the RealTimeStylus Class object.
 * @remarks
 * 
 * Use locks when you must protect access to and modification of the plug-ins or properties of the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object through the <b>IRealTimeStylusSynchronization Interface</b> interface.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> enumeration to specify the lock.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-irealtimestylussynchronization
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IRealTimeStylusSynchronization extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRealTimeStylusSynchronization
     * @type {Guid}
     */
    static IID => Guid("{aa87eab8-ab4a-4cea-b5cb-46d84c6a2509}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireLock", "ReleaseLock"]

    /**
     * Retrieves the specified lock.
     * @param {Integer} lock The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> value that indicates which object lock to use.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-irealtimestylussynchronization-acquirelock
     */
    AcquireLock(lock) {
        result := ComCall(3, this, "int", lock, "HRESULT")
        return result
    }

    /**
     * Releases the specified lock.
     * @param {Integer} lock The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestyluslocktype">RealTimeStylusLockType Enumeration</a> value that indicates which object lock to release.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-irealtimestylussynchronization-releaselock
     */
    ReleaseLock(lock) {
        result := ComCall(4, this, "int", lock, "HRESULT")
        return result
    }
}
