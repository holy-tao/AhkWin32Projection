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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStackBackTrace"]

    /**
     * 
     * @param {Integer} maxFramesToCapture 
     * @param {Pointer<Pointer>} stackBackTrace 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionstackbacktrace-getstackbacktrace
     */
    GetStackBackTrace(maxFramesToCapture, stackBackTrace) {
        stackBackTraceMarshal := stackBackTrace is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", maxFramesToCapture, stackBackTraceMarshal, stackBackTrace, "uint*", &framesCaptured := 0, "HRESULT")
        return framesCaptured
    }
}
