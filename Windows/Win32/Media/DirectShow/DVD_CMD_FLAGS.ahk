#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that control how the DVD Navigator Filter filter handles command synchronization.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_cmd_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_CMD_FLAGS{

    /**
     * The DVD Navigator will not flush its buffers when it issues the command, will not send any events, and will not to block the thread of execution on any method call.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_None => 0

    /**
     * The DVD Navigator will flush all of its buffered video data before issuing the command. This can cause the DVD Navigator to discard approximately two seconds of video, which will decrease the response time but cause a gap in the playback data.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_Flush => 1

    /**
     * The DVD Navigator will send an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-cmd-start">EC_DVD_CMD_START</a> event when the command begins, and an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-cmd-end">EC_DVD_CMD_END</a> event when the command ends. The event parameters contain the status code of the operation.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_SendEvents => 2

    /**
     * The DVD Navigator blocks until the command completes or is canceled.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_Block => 4

    /**
     * Currently not used.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_StartWhenRendered => 8

    /**
     * The DVD Navigator will block until the specified action is actually rendered. This flag can be used with the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playchaptersautostop">IDvdControl2::PlayChaptersAutoStop</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playperiodintitleautostop">IDvdControl2::PlayPeriodInTitleAutoStop</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectsubpicturestream">IDvdControl2::SelectSubpictureStream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setsubpicturestate">IDvdControl2::SetSubpictureState</a>
     * </li>
     * </ul>
     * For example, when used with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playchaptersautostop">PlayChaptersAutoStop</a>, this flag causes the DVD Navigator to block until the specified chapters have all played. When used with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectsubpicturestream">SelectSubpictureStream</a>, the flag causes the DVD Navigator to block until the new subpicture is rendered.
     * @type {Integer (Int32)}
     */
    static DVD_CMD_FLAG_EndAfterRendered => 16
}
