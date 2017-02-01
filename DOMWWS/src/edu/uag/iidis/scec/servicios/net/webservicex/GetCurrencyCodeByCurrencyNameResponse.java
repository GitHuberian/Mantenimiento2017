
package net.webservicex;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="GetCurrencyCodeByCurrencyNameResult" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "getCurrencyCodeByCurrencyNameResult"
})
@XmlRootElement(name = "GetCurrencyCodeByCurrencyNameResponse")
public class GetCurrencyCodeByCurrencyNameResponse {

    @XmlElement(name = "GetCurrencyCodeByCurrencyNameResult")
    protected String getCurrencyCodeByCurrencyNameResult;

    /**
     * Obtiene el valor de la propiedad getCurrencyCodeByCurrencyNameResult.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGetCurrencyCodeByCurrencyNameResult() {
        return getCurrencyCodeByCurrencyNameResult;
    }

    /**
     * Define el valor de la propiedad getCurrencyCodeByCurrencyNameResult.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGetCurrencyCodeByCurrencyNameResult(String value) {
        this.getCurrencyCodeByCurrencyNameResult = value;
    }

}
