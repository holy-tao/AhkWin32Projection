#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectLoggingService extends IUnknown{
    /**
     * The interface identifier for IAudioProcessingObjectLoggingService
     * @type {Guid}
     */
    static IID => Guid("{698f0107-1745-4708-95a5-d84478a62a65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} level 
     * @param {PWSTR} format 
     * @returns {String} Nothing - always returns an empty string
     */
    ApoLog(level, format) {
        format := format is String ? StrPtr(format) : format

        ComCall(3, this, "int", level, "ptr", format)
        return result
    }
}
