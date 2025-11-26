#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidAudioRendererEvent.ahk

/**
 * Implements an event system for the audio renderer associated with a Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRendererEvent2)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidaudiorendererevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAudioRendererEvent2 extends IMSVidAudioRendererEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidAudioRendererEvent2
     * @type {Guid}
     */
    static IID => Guid("{e3f55729-353b-4c43-a028-50f79aa9a907}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AVDecAudioDualMono", "AVAudioSampleRate", "AVAudioChannelConfig", "AVAudioChannelCount", "AVDecCommonMeanBitRate", "AVDDSurroundMode", "AVDecCommonInputFormat", "AVDecCommonOutputFormat"]

    /**
     * Indicates a change in the AVDecAudioDualMono codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avdecaudiodualmono
     */
    AVDecAudioDualMono() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVAudioSampleRate codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avaudiosamplerate
     */
    AVAudioSampleRate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecAudioDualMono codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avaudiochannelconfig
     */
    AVAudioChannelConfig() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVAudioChannelCount codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avaudiochannelcount
     */
    AVAudioChannelCount() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonMeanBitRate codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avdeccommonmeanbitrate
     */
    AVDecCommonMeanBitRate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDDSurroundMode codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avddsurroundmode
     */
    AVDDSurroundMode() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonInputFormat codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avdeccommoninputformat
     */
    AVDecCommonInputFormat() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonOutput codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidaudiorendererevent2-avdeccommonoutputformat
     */
    AVDecCommonOutputFormat() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
