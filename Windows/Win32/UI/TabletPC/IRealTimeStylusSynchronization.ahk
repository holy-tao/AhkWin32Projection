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
     * 
     * @param {Integer} lock 
     * @returns {HRESULT} 
     */
    AcquireLock(lock) {
        result := ComCall(3, this, "int", lock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lock 
     * @returns {HRESULT} 
     */
    ReleaseLock(lock) {
        result := ComCall(4, this, "int", lock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
