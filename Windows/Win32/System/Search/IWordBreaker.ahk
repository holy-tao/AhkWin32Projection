#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Parses text and identifies individual words and phrases. This interface is a language-specific language resource component. It is used in background processes and must be optimized for both throughput and minimal use of resources.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement this interface to create a custom word breaker for a language. Windows Search calls the methods of this interface when it builds content indexes and runs queries.
  * 
  * Word breaker components for Windows Search run in the Local Security context. They should be written to manage buffers and the stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-iwordbreaker
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordBreaker extends IUnknown{
    /**
     * The interface identifier for IWordBreaker
     * @type {Guid}
     */
    static IID => Guid("{d53552c8-77e3-101a-b552-08002b33b0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fQuery 
     * @param {Integer} ulMaxTokenSize 
     * @param {Pointer<BOOL>} pfLicense 
     * @returns {HRESULT} 
     */
    Init(fQuery, ulMaxTokenSize, pfLicense) {
        result := ComCall(3, this, "int", fQuery, "uint", ulMaxTokenSize, "ptr", pfLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TEXT_SOURCE>} pTextSource 
     * @param {Pointer<IWordSink>} pWordSink 
     * @param {Pointer<IPhraseSink>} pPhraseSink 
     * @returns {HRESULT} 
     */
    BreakText(pTextSource, pWordSink, pPhraseSink) {
        result := ComCall(4, this, "ptr", pTextSource, "ptr", pWordSink, "ptr", pPhraseSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwcNoun 
     * @param {Integer} cwcNoun 
     * @param {PWSTR} pwcModifier 
     * @param {Integer} cwcModifier 
     * @param {Integer} ulAttachmentType 
     * @param {PWSTR} pwcPhrase 
     * @param {Pointer<UInt32>} pcwcPhrase 
     * @returns {HRESULT} 
     */
    ComposePhrase(pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType, pwcPhrase, pcwcPhrase) {
        pwcNoun := pwcNoun is String ? StrPtr(pwcNoun) : pwcNoun
        pwcModifier := pwcModifier is String ? StrPtr(pwcModifier) : pwcModifier
        pwcPhrase := pwcPhrase is String ? StrPtr(pwcPhrase) : pwcPhrase

        result := ComCall(5, this, "ptr", pwcNoun, "uint", cwcNoun, "ptr", pwcModifier, "uint", cwcModifier, "uint", ulAttachmentType, "ptr", pwcPhrase, "uint*", pcwcPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppwcsLicense 
     * @returns {HRESULT} 
     */
    GetLicenseToUse(ppwcsLicense) {
        result := ComCall(6, this, "ushort*", ppwcsLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
