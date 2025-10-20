#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables applications and other objects to receive notifications of changes in the progress of a downloading operation.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iprogressnotify
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IProgressNotify extends IUnknown{
    /**
     * The interface identifier for IProgressNotify
     * @type {Guid}
     */
    static IID => Guid("{a9d758a0-4617-11cf-95fc-00aa00680db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwProgressCurrent 
     * @param {Integer} dwProgressMaximum 
     * @param {BOOL} fAccurate 
     * @param {BOOL} fOwner 
     * @returns {HRESULT} 
     */
    OnProgress(dwProgressCurrent, dwProgressMaximum, fAccurate, fOwner) {
        result := ComCall(3, this, "uint", dwProgressCurrent, "uint", dwProgressMaximum, "int", fAccurate, "int", fOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
