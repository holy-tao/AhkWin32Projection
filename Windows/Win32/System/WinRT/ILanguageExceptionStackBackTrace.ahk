#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows projections to provide custom stack trace for that exception.
 * @remarks
 * 
  * It is recommended that language projections implement this interface when the stack trace is not captured by the relevant Global Error Handler API.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionstackbacktrace
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ILanguageExceptionStackBackTrace extends IUnknown{
    /**
     * The interface identifier for ILanguageExceptionStackBackTrace
     * @type {Guid}
     */
    static IID => Guid("{cbe53fb5-f967-4258-8d34-42f5e25833de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} maxFramesToCapture 
     * @param {Pointer<UIntPtr>} stackBackTrace 
     * @param {Pointer<UInt32>} framesCaptured 
     * @returns {HRESULT} 
     */
    GetStackBackTrace(maxFramesToCapture, stackBackTrace, framesCaptured) {
        result := ComCall(3, this, "uint", maxFramesToCapture, "ptr*", stackBackTrace, "uint*", framesCaptured, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
