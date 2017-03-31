<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
  <xsl:template match="text()">
</xsl:template>
  <xsl:template match="meeting">
    <fo:root>
      <xsl:attribute name="font">12pt Liberation Serif</xsl:attribute>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="page" margin="2cm" margin-right="1cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="topic[not(@skip)]|topic[@skip='0']">
    <xsl:param name="topic" select="."/>
    <xsl:variable name="ballot-text">
      <xsl:choose>
        <xsl:when test="@ballot-text">
          <fo:table-cell number-columns-spanned="3">
            <fo:block text-align="justify">Бюллетень для голосования по <xsl:value-of select="@ballot-text"/></fo:block>
          </fo:table-cell>
        </xsl:when>
        <xsl:otherwise>
          <fo:table-cell>
            <fo:block text-align="center">Бюллетень для голосования по</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block text-align="center">
              <xsl:value-of select="count(preceding-sibling::topic) + 1"/>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block text-align="center">вопросу повестки дня</fo:block>
          </fo:table-cell>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:for-each select="//creditor">
      <fo:block-container break-after="page">
        <fo:block font-size="6pt" text-align="right">Типовая форма бюллетеня для голосования участников собрания кредиторов N 1</fo:block>
        <fo:block text-align="center" font-size="18pt" margin-top="0.5cm">Собрание кредиторов</fo:block>
        <fo:block text-align="center" border-bottom="solid thin black" margin-top="0.5cm"><xsl:value-of select="//debtor/name"/> (ИНН <xsl:value-of select="//debtor/inn"/>, ОГРН <xsl:value-of select="//debtor/ogrn"/>), <xsl:value-of select="//debtor/address"/></fo:block>
        <fo:block text-align="center" font-size="10pt">(наименование и нахождение должника)</fo:block>
        <fo:table width="17cm" table-layout="fixed" margin-top="0.5cm">
          <fo:table-column column-width="40%"/>
          <fo:table-column column-width="10%"/>
          <fo:table-column column-width="50%"/>
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border-bottom="thin solid black" vertical-align="bottom">
                <fo:block text-align="center">
                  <xsl:value-of select="/meeting/date"/>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block/>
              </fo:table-cell>
              <fo:table-cell border-bottom="thin solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="/meeting/place"/>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block text-align="center" font-size="10pt">(дата проведения)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block/>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block text-align="center" font-size="10pt">(место проведения)</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:table width="17cm" table-layout="fixed" margin-top="0.5cm">
          <fo:table-column column-width="45%"/>
          <fo:table-column column-width="25%"/>
          <fo:table-column column-width="30%"/>
          <fo:table-body>
            <fo:table-row>
              <xsl:copy-of select="$ballot-text"/>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block/>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block text-align="center" font-size="10pt" border-top="thin solid black">(порядковый номер)</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block/>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block text-align="center" border-bottom="thin solid black" margin-top="0.5cm">
          <xsl:value-of select="$topic"/>
        </fo:block>
        <fo:block text-align="center" font-size="10pt">(формулировка решения, поставленного на голосование)</fo:block>
        <fo:block text-align="center" border-bottom="thin solid black" margin-top="0.5cm">
          <xsl:value-of select="text()"/>
        </fo:block>
        <fo:block text-align="center" font-size="10pt">(наименование, Ф. И. О. участника собрания кредиторов)</fo:block>
        <fo:table width="17cm" table-layout="fixed" margin-top="0.5cm">
          <fo:table-column column-width="75%"/>
          <fo:table-column column-width="25%"/>
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell>
                <fo:block>Общее число голосов участника собрания кредиторов</fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom="thin solid black">
                <fo:block text-align="center">
                  <xsl:value-of select="../claim"/>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:table width="17cm" table-layout="fixed" border="thin solid black" margin-top="0.5cm">
          <fo:table-column column-width="33%"/>
          <fo:table-column column-width="34%"/>
          <fo:table-column column-width="33%"/>
          <fo:table-header>
            <fo:table-row>
              <fo:table-cell border="thin solid black">
                <fo:block text-align="center">За</fo:block>
              </fo:table-cell>
              <fo:table-cell border="thin solid black">
                <fo:block text-align="center">Против</fo:block>
              </fo:table-cell>
              <fo:table-cell border="thin solid black">
                <fo:block text-align="center">Воздержался</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border="thin solid black">
                <fo:block> </fo:block>
              </fo:table-cell>
              <fo:table-cell border="thin solid black">
                <fo:block> </fo:block>
              </fo:table-cell>
              <fo:table-cell border="thin solid black">
                <fo:block> </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block font-weight="bold" text-align="center" margin-top="0.5cm">Разъяснение порядка заполнения бюллетеня</fo:block>
        <fo:block text-align="justify" margin-top="0.5cm">Поставьте любой знак в квадрате с выбранным Вами вариантом голосования.</fo:block>
        <fo:block text-align="justify" margin-top="0.5cm">Бюллетень, в котором знак поставлен более чем в одном квадрате либо не поставлен ни в одном из них, а также бюллетень, подписанный лицом, не зарегистрированным в журнале регистрации, либо неподписанный бюллетень
считаются недействительными.</fo:block>
        <fo:block text-align="justify" margin-top="0.5cm">Не допускается заполнение бюллетеня для голосования карандашом и внесение в него каких-либо исправлений.</fo:block>
        <fo:block border-bottom="solid thin black" margin-top="0.5cm"> </fo:block>
        <fo:block font-size="10pt" text-align="center">(Фамилия, инициалы, подпись участника собрания кредиторов/представителя участника собрания кредиторов)</fo:block>
      </fo:block-container>
    </xsl:for-each>
  </xsl:template>
</xsl:transform>
